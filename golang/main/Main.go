package main

import (
	"fmt"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
	"github.com/jmoiron/sqlx"
)

func main() {
	router := mux.NewRouter().StrictSlash(true)
	router.HandleFunc("/helloworld", helloWorld)
	router.HandleFunc("/selectAll", selectAll)

	log.Fatal(http.ListenAndServe(":8080", router))
}

func helloWorld(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "welcome")
}

func selectAll(w http.ResponseWriter, r *http.Request) {
	db, err := sqlx.Connect("mysql", "root:root@tcp(127.0.0.1:3306)/helloworld")
	if err != nil {
		log.Fatalln(err)
		return
	}

	var helloworlds []HelloWorld
	err = db.Select(&helloworlds, "SELECT * FROM helloworld")
	if err != nil {
		fmt.Println("查询失败 --> ", err)
		return
	}

	fmt.Fprintln(w, "select :", helloworlds)
}

type HelloWorld struct {
	Id   int    `db:"id"`
	Name string `db:"name"`
}
