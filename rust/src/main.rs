#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;
extern crate mysql;

// 引用db_util.rs文件模块
pub mod db_util;
use self::db_util::db_util::select_all;

#[get("/helloworld")]
fn helloworld() -> &'static str {
    "welcome"
}

#[get("/selectAll")]
fn selectall() -> String {
    select_all()
}

fn main() {
    rocket::ignite().mount("/", routes![helloworld, selectall]).launch();
}