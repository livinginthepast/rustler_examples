extern crate rustler;

use rustler::{Env, Term};

mod atoms;
mod state;

fn on_load(env: Env, _info: Term) -> bool {
    rustler::resource!(state::StateResource, env);
    true
}

rustler::init!(
    "Elixir.Resources.NIF",
    [state::new, state::get, state::set],
    load = on_load
);
