#[macro_use]
extern crate mysql;

use mysql as my;

use serde::{Serialize, Deserialize};

pub mod db_util {

    #[derive(Serialize, Deserialize, Debug, PartialEq, Eq)]
    struct Helloworld {
        id: i32,
        name: Option<String>,
    }

    pub fn selectAll() {
        let pool = my::Pool::new("mysql://root:root@localhost:3306/helloworld").unwrap();

        let selected_helloworld: Vec<Helloworld> =
            pool.prep_exec("select * from helloworld", ())
                .map(|result| {
                    result.map(|x| x.unwrap()).map(|row| {
                        // ⚠️ Note that from_row will panic if you don't follow your schema
                        let (id, name) = my::from_row(row);
                        Helloworld {
                            id: id,
                            name: name,
                        }
                    }).collect()
                }).unwrap();

        let serialized = serde_json::to_string(&selected_helloworld).unwrap();

        println!("serialized = {}", serialized);
    }

}
