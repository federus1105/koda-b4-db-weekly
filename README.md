```mermaid
erDiagram
ROLE {
    ENUM admin
    ENUM user
    }

SIZE {
    ENUM regular
    ENUM medium
    ENUM large
}

VARIANT {
    ENUM ice
    ENUM hot
}

USERS {
    int id
    string email
    string password
    ROLE role
    }

ACCOUNT {
    int id
    int id_users
    string fullname
    string phoneNumber
    string address
    string ptotos
    timestamp createdAt
    timestamp updatedAt
}

ORDERS {
    int id
    int id_account
    int id_paymenMethod
    string fullname
    string address
    string phoneNumber
    quantity FLOAT NOT NULL,
    DELIVERY delivery
    string total
    boolean status 
    VARIANT variant
    SIZE size
    timestamp createdAt
}

PAYMENT_METHOD {
    int id
    string name
    string photos
}

PRODUCT_IMAGES {
    int id
    string photos_one
    string photos_two
    string photos_three
    string photos_four
    timestamp createdAt
    timestamp updatedAt
}

PRODUCT {
    int id
    string name
    string description
    int id_product_images
    float rating
    float priceOriginal
    float priceDiscount
    boolean flash_sale
    int stock
    timestamp createdAt
    timestamp updatedAt
}

CATEGORIES {
    int id
    string name
}

PRODUCT_CATEGORIES {
    int id_product
    int id_categories
}

PRODUCT_ORDERS {
   int id_product
   int id_order
}


    ROLE ||--o{ USERS : "assigned to"
    USERS ||--|| ACCOUNT : "create an account"
    CATEGORIES||--o{ PRODUCT_CATEGORIES : ""

    ORDERS ||--o{SIZE: ""
    ORDERS ||--o{VARIANT : ""
    PRODUCT ||--o{PRODUCT_CATEGORIES :""
    
    ORDERS ||--||PAYMENT_METHOD:""
    ACCOUNT ||--o{ORDERS :""

    ORDERS ||--o{PRODUCT_ORDERS: ""
    PRODUCT ||--o{PRODUCT_ORDERS :""

    PRODUCT_IMAGES |o--|{PRODUCT: ""



```