USE inventory_db;

DELIMITER $$

CREATE PROCEDURE AddNewProductManualID(
   IN p_name VARCHAR(255),
   IN p_category VARCHAR(100),
   IN p_price DECIMAL(10,2),
   IN p_stock INT,
   IN p_reorder INT,
   IN p_supplier INT
)
BEGIN
  DECLARE new_prod_id INT;
  DECLARE new_shipment_id INT;
  DECLARE new_entry_id INT;

  START TRANSACTION;

  -- BUG FIX: You must generate the ID before using it!
  SELECT IFNULL(MAX(product_id), 0) + 1 INTO new_prod_id FROM products;

  -- 1. Insert into products
  INSERT INTO products(product_id, product_name, category, price, stock_quantity, reorder_level, supplier_id)
  VALUES(new_prod_id, p_name, p_category, p_price, p_stock, p_reorder, p_supplier);

  -- 2. Insert into shipments (Initial Stock)
  SELECT IFNULL(MAX(shipment_id), 0) + 1 INTO new_shipment_id FROM shipments;
  INSERT INTO shipments(shipment_id, product_id, supplier_id, quantity_received, shipment_date)
  VALUES(new_shipment_id, new_prod_id, p_supplier, p_stock, CURDATE());

  -- 3. Insert into stock_entries (Initial Restock)
  SELECT IFNULL(MAX(entry_id), 0) + 1 INTO new_entry_id FROM stock_entries;
  INSERT INTO stock_entries(entry_id, product_id, change_quantity, change_type, entry_date)
  VALUES(new_entry_id, new_prod_id, p_stock, 'Restock', CURDATE());

  COMMIT;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE MarkReorderAsReceived(IN in_reorder_id INT)
BEGIN
  DECLARE prod_id INT;
  DECLARE qty INT;
  DECLARE sup_id INT;
  DECLARE new_shipment_id INT;
  DECLARE new_entry_id INT;

  START TRANSACTION;

  SELECT product_id, reorder_quantity
  INTO prod_id, qty
  FROM reorders
  WHERE reorder_id = in_reorder_id;

  SELECT supplier_id
  INTO sup_id
  FROM products
  WHERE product_id = prod_id;

  UPDATE reorders
  SET status = 'Received'
  WHERE reorder_id = in_reorder_id;

  UPDATE products
  SET stock_quantity = stock_quantity + qty
  WHERE product_id = prod_id;

  SELECT IFNULL(MAX(shipment_id),0)+1 INTO new_shipment_id FROM shipments;

  INSERT INTO shipments(shipment_id, product_id, supplier_id, quantity_received, shipment_date)
  VALUES(new_shipment_id, prod_id, sup_id, qty, CURDATE());

  SELECT IFNULL(MAX(entry_id),0)+1 INTO new_entry_id FROM stock_entries;

  INSERT INTO stock_entries(entry_id, product_id, change_quantity, change_type, entry_date)
  VALUES(new_entry_id, prod_id, qty, 'Restock', CURDATE());

  COMMIT;
END $$

DELIMITER ;
