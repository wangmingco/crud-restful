#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;

mod db_util;
pub use db_util;

#[get("/helloworld")]
fn helloworld() -> &'static str {
    "welcome"
}

#[get("/selectAll")]
fn selectall() -> &'static str {
    db_util::selectAll();
    "Hello, world!"
}

fn main() {
    rocket::ignite().mount("/", routes![helloworld, selectall]).launch();
}