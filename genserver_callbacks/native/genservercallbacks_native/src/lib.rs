extern crate rustler;
use rustler::{Env, Term};

mod atoms;
mod state;

pub fn on_load(env: Env, _info: Term) -> bool {
    rustler::resource!(state::StateResource, env);
    true
}

rustler::init!(
    "Elixir.GenServerCallbacks.Native",
    [
        state::new,
        state::get,
        state::set
    ],
    load = on_load
);
