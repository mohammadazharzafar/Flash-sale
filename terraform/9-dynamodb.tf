resource "aws_dynamodb_table" "user_table" {
  name           = "User"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "ProductId"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "ProductId"
    type = "S"
  }

  tags = {
    Name = "UserTable"
  }
}

resource "aws_dynamodb_table" "product_table" {
  name           = "Product"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "ProductId"
  range_key      = "UserId_OrderId"

  attribute {
    name = "ProductId"
    type = "S"
  }

  attribute {
    name = "UserId_OrderId"
    type = "S"
  }

  tags = {
    Name = "ProductTable"
  }
}

resource "aws_dynamodb_table" "order_table" {
  name           = "Order"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "OrderId"
  range_key      = "OrderId_InventoryId"

  attribute {
    name = "OrderId"
    type = "S"
  }

  attribute {
    name = "OrderId_InventoryId"
    type = "S"
  }

  tags = {
    Name = "OrderTable"
  }
}

resource "aws_dynamodb_table" "inventory_table" {
  name           = "Inventory"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "InventoryId"
  range_key      = "InventoryId_UserId"

  attribute {
    name = "InventoryId"
    type = "S"
  }

  attribute {
    name = "InventoryId_UserId"
    type = "S"
  }

  tags = {
    Name = "InventoryTable"
  }
}
