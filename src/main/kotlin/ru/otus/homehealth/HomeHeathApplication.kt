package ru.otus.homehealth

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class HomeHeathApplication

fun main(args: Array<String>) {
    runApplication<HomeHeathApplication>(*args)
}
