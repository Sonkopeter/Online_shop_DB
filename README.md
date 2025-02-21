# Online_shop_DB
База данных написана в СУБД PostgreSQL. В репозитории прикреплены:
- создание БД (`Инициализация.sql`)
- запрос к БД(`Запрос.sql`)
---
- ER-диаграмма построена в онлайн редакторе https://www.lucidchart.com (`Online_shop.png`)
---
![Иллюстрация к проекту]([https://github.com/Sonkopeter/Library-DB/blob/main/LibraryDB.png](https://github.com/Sonkopeter/Online_shop_DB/blob/main/Online_shop.png))

---

### 1. ** Таблица `Buyer` (Покупатель)**
  - **Атрибуты**:
    - `buyer_id` (PK)
    - `first_name`, `last_name`, `patronymic`
    - `email_address`
    - `mobile_phone`
  - **Связи**:
    - Связь **один ко многим**  `Buyer.buyer_id` → `Address.buyer_id` (Один покупатель может иметь несколько адресов).
    - Связь **один ко многим**  `Buyer.buyer_id` → `Order.buyer_id` (Один покупатель может совершить несколько заказов).


#### 2. **Таблица `Buyer_address` (Адрес покупателя)**
  - **Атрибуты**:
    - `address_id` 
    - `buyer_id` 
    - `country_name`, `address_compound`, `postal_code`: Страна, адрес и почтовый индекс.
    - `is_delivery_address`: Флаг, указывающий, является ли адрес адресом доставки по умолчанию.
  - **Связи**:
    - Связь **многие к одному** `Buyer_address.buyer_id` → `Buyer.buyer_id` (У одного покупателя может быть несколько адресов на выбор).

      
### 3. ** Таблица `Warehouse` (Склад)**
- **Атрибуты**:
  - `warehouse_id`
  - `warehouse_name`
  - `warehouse_address`
- **Связи**:
    - Связь **один ко многим** `Warehouse.warehouse_id` → `Item_stock.warehouse_id` (Один склад может хранить множество товаров).

### 4. ** Таблица `Item_stock` (Запасы товаров)**
- **Атрибуты**:
  - `item_stock_id` 
  - `warehouse_id` 
  - `item_id` 
  - `item_stock_quantity`: Количество товара на складе.
- **Связи**:
    - Связь **многие к одному** `Item_stock.warehouse_id` → `Warehouse.warehouse_id` (Много записей о запасах могут относиться к одному складу).
    - Связь **многие к одному** `Item_stock.item_id` → `Item_info.item_id` (Много записей о запасах могут относиться к одному товару).

### 5. ** Таблица `Order` (Заказ)**
- **Атрибуты**:
  - `order_id` 
  - `buyer_id`
  - `delivery_id` 
  - `payment_id` 
  - `order_date`
  - `order_status`
  - `total_price`: Общая стоимость заказа.
- **Связи**:
    - Связь **один ко многим** `Buyer.buyer_id` → `Order.buyer_id` (Один покупатель может совершить несколько заказов).
    - Связь **один к одному** `Order.payment_id` → `Payment.payment_id` (Каждый заказ соответствует одному платежу).
    - Связь **один к одному** `Order.delivery_id` → `Delivery.delivery_id` (Каждый заказ соответствует одной доставке).

### 6. ** Таблица `Order_item` (Товары в заказе, промежуточная таблица, составной ключ)**
- **Атрибуты**:
  - `order_id` 
  - `item_id` 
  - `order_item_quantity`: Количество товара в заказе.
- **Связи**:
    - Связь **многие к одному** `Order_item.item_id` → `Item_info.item_id` (Один товар может быть в нескольких заказах).
      
### 7. ** Таблица `Delivery` (Доставка)**
- **Атрибуты**:
  - `delivery_id` 
  - `sent_date`
  - `is_delivered`: Флаг, указывающий, была ли доставка завершена.
  - `delivery_address`
  - `delivery_cost`
  - `estimated_delivery_date`
- **Связи**:
    - Связь **один к одному** `Delivery.delivery_id` → `Order.delivery_id` (Одна доставка может использоваться для одного заказа).

### 8. ** Таблица `Bank_info` (Информация о банке)**
- **Атрибуты**:
  - `bank_id` 
  - `bank_name`
    - Связь **один ко многим** `Bank_info.bank_id` → `Payment.bank_id` (Один банк может быть связан с несколькими платежами).

### 9. ** Таблица `Payment` (Платеж)**
- **Атрибуты**:
  - `payment_id` 
  - `bank_id` 
  - `payment_is_completed`: Флаг, указывающий, был ли платеж завершен.
  - `payment_date`
- **Связи**:
    - Связь **один к одному** `Payment.payment_id` → `Order.payment_id` (Каждый заказ связан с одним платежом).

### 10. ** Таблица `Item_info` (Информация о товаре)**
- **Описание**: Хранит информацию о товарах.
- **Атрибуты**:
  - `item_id` 
  - `item_name`
  - `item_description`
  - `item_price`
- **Связи**:
    - Связь **один ко многим** `Item_info.item_id` → `Item_stock.item_id` (Один товар может находиться на нескольких складах).
    - Связь **один ко многим** `Item_info.item_id` → `Order_item.item_id` (Один товар может быть в нескольких заказах).

---
