package co.wangming.crud.crudrestful.controller;

import co.wangming.crud.crudrestful.mapper.HelloWorldMapper;
import co.wangming.crud.crudrestful.model.HelloWorld;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Created By WangMing On 2020-01-20
 **/
@RestController
@RequestMapping()
public class HelloWorldController {

    @Autowired
    private HelloWorldMapper helloWorldMapper;

    @GetMapping(value = "/helloworld")
    public String hi() {
        return "welcome";
    }

    @GetMapping(value = "/selectAll")
    public String selectAll() {
        List<HelloWorld> all = helloWorldMapper.selectAll();
        return all.stream().map(it -> it.toString()).collect(Collectors.joining(", "));
    }
}
