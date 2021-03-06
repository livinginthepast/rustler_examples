use rustler::types::pid::Pid;
use rustler::Encoder;
use rustler::{Atom, Env, NifResult, ResourceArc, Term};
use std::sync::Mutex;

use crate::atoms;

pub struct State {
    value: String,
    pid: Pid,
}

impl State {
    pub fn pid(&self) -> Pid {
        self.pid.clone()
    }

    pub fn get(&self) -> String {
        self.value.clone()
    }

    pub fn update(&mut self, value: String) -> &mut State {
        self.value = value.clone();
        self
    }
}

pub struct StateResource(Mutex<State>);

#[rustler::nif]
fn get<'a>(env: Env<'a>, resource: ResourceArc<StateResource>) -> Term<'a> {
    let mut msg_env = rustler::env::OwnedEnv::new();

    std::thread::spawn(move || {
        let state = match resource.0.try_lock() {
            Err(_) => return Err(atoms::lock_fail()),
            Ok(guard) => guard,
        };

        let pid = state.pid();
        let result = state.get();

        msg_env.send_and_clear(&pid, |env| (atoms::current_value(), result).encode(env));

        // here to make the type checker happy
        Ok(pid)
    });

    atoms::ok().encode(env)
}

#[rustler::nif]
fn set<'a>(env: Env<'a>, resource: ResourceArc<StateResource>, value: String) -> Term<'a> {
    let mut state = match resource.0.try_lock() {
        Err(_) => return (atoms::error(), atoms::lock_fail()).encode(env),
        Ok(guard) => guard,
    };

    state.update(value.clone());

    atoms::ok().encode(env)
}

#[rustler::nif]
pub fn new<'a>(env: Env<'a>) -> NifResult<(Atom, ResourceArc<StateResource>)> {
    let pid = env.pid();

    let state = State {
        value: "Hello world".to_string(),
        pid: pid,
    };
    let resource = ResourceArc::new(StateResource(Mutex::new(state)));

    Ok((atoms::ok(), resource))
}
