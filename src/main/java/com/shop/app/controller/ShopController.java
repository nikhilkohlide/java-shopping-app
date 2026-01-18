package com.shop.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ShopController {

    @GetMapping("/")
    public String home(Model model) {

        List<Product> products = new ArrayList<>();

        products.add(new Product("Mobile", "Latest Android smartphone", 15000, "In Stock"));
        products.add(new Product("Laptop", "High performance laptop", 65000, "In Stock"));
        products.add(new Product("Headphones", "Noise cancelling headphones", 3000, "Out of Stock"));

        model.addAttribute("products", products);

        return "index";
    }

    // Inner Product class for now
    static class Product {
        private String name;
        private String description;
        private int price;
        private String availability;

        public Product(String name, String description, int price, String availability) {
            this.name = name;
            this.description = description;
            this.price = price;
            this.availability = availability;
        }

        public String getName() { return name; }
        public String getDescription() { return description; }
        public int getPrice() { return price; }
        public String getAvailability() { return availability; }
    }
}

