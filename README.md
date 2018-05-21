# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.5.0

routes:

- Develop
    * Ingredients
        * params: 
        ```
        {
            "ingredient":
            {
                "name": String,
                "price": Integer,
                "weight": Float
            }
        }
        ```
        - GET /ingredients
        - GET /ingredients/:id
        - POST /ingredients, params
        - PATCH /ingredients/:id, params
        - DELETE /ingredients/:id
                
    * Orders
        * params: 
        ```
        {
            "order":
            {
                "table_number": Integer
            }
        }
        ```
        - GET /orders
        - GET /orders/:id
        - POST /orders, params
        - PATCH /orders/:id, params
        - DELETE /orders/:id
        
    * Sections
        * params: 
        ```
        {
            "section":
            {
                "name": String
            }
        }
        ```
        - GET /sections
        - GET /sections/:id
        - POST /sections, params
        - PATCH /sections/:id, params
        - DELETE /sections/:id
        
    * Compositions
        * params: 
        ```
        {
            "composition":
            {
                "dish_id": dish_id,
                "ingredient_id": ingredient_id,
                "ingredient_name": String,
                "count": Integer,
                "weight": Float,
                "price": Float
            }
        }
        ```
        - GET /compositions
        - GET /compositions/:id
        - POST /compositions, params
        - PATCH /compositions/:id, params
        - DELETE /compositions/:id
        
    * Dishes
        * params: 
        ```
        {
            "dish":
            {
                "section_id": section_id,
                "name": String,
                "price": Float
            }
        }
        ```
        - GET /dishes
        - GET /dishes/:id
        - POST /dishes, params
        - PATCH /dishes/:id, params
        - DELETE /dishes/:id
        
    * Supplement_orders
        * params: 
        ```
        {
            "supplement_order":
            {
                "dish_id": dish_id,
                "dish_name": String,
                "order_id": order_id,
                "count": Integer
            }
        }
        ```
        - GET /supplement_orders
        - GET /supplement_orders/:id
        - POST /supplement_orders, params
        - PATCH /supplement_orders/:id, params
        - DELETE /supplement_orders/:id

- Production

    URL: https://ravendb-client.herokuapp.com/

     * Ingredients
        - GET test/ingredients
        
    * Orders
        - GET test/orders
        
    * Sections
        - GET test/sections
        
    * Compositions
        - GET test/compositions
        
    * Dishes
        - GET test/dishes
        
    * Supplement_orders
        - GET test/supplement_orders