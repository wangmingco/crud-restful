#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;

#[get("/helloworld")]
fn helloworld() -> &'static str {
    "welcome"
}

#[get("/selectAll")]
fn selectAll() -> &'static str {
    "Hello, world!"
}

fn main() {
    rocket::ignite().mount("/", routes![helloworld, selectAll]).launch();
}