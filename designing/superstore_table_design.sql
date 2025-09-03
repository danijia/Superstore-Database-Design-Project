CREATE TABLE "customers" (
	"customer_id" TEXT, 
	"customer_name" TEXT, 
	"segment" TEXT,
	PRIMARY KEY("customer_id")
); 

CREATE TABLE "orders" (
	"order_id" TEXT, 
	"order_date" TEXT, 
	"ship_date" TEXT, 
	"ship_mode" TEXT, 
	"customer_id" TEXT, 
	"country" TEXT, 
	"city" TEXT, 
	"state" TEXT, 
	"postal_code" INTEGER, 
	"region" TEXT, 
	PRIMARY KEY("order_id"), 
	FOREIGN KEY("customer_id") REFERENCES "customers"("customer_id")
); 

CREATE TABLE "order_items" (
	"row_id" INTEGER, 
	"order_id" TEXT, 
	"product_id" TEXT, 
	"sales" REAL, 
	"quantity" INTEGER, 
	"discount" REAL, 
	"profit" REAL, 
	PRIMARY KEY("row_id") ,
	FOREIGN KEY("order_id") REFERENCES "orders"("order_id"),
	FOREIGN KEY("product_id") REFERENCES "products"("product_id")
); 

CREATE TABLE "products" (
	"product_id" TEXT,
	"category" TEXT,
	"sub_category" TEXT, 	
	"product_name" TEXT,  
	PRIMARY KEY("product_id")
); 
	
	