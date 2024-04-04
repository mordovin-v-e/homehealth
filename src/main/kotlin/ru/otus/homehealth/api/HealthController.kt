package ru.otus.homehealth.api

import org.springframework.http.ResponseEntity.ok
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HealthController {

    @GetMapping("health")
    fun health() = ok(mapOf("status" to "OK"))
}