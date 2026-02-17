USE inventory_db;

CREATE OR REPLACE VIEW product_inventory_history AS
SELECT
    pih.product_id,
    pih.record_type,
    pih.record_date,
    pih.quantity,
    pih.change_type,
    pr.supplier_id
FROM (
    SELECT
        product_id,
        'Shipment' AS record_type,
        shipment_date AS record_date,
        quantity_received AS quantity,
        NULL AS change_type
    FROM shipments

    UNION ALL

    SELECT
        product_id,
        'Stock Entry' AS record_type,
        entry_date AS record_date,
        change_quantity AS quantity,
        change_type
    FROM stock_entries
) pih
JOIN products pr ON pr.product_id = pih.product_id;
