-- Create the Library Management System tables

-- Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    book_code VARCHAR(50) UNIQUE,
    book_name VARCHAR(255),
    author VARCHAR(255),
    publisher VARCHAR(255),
    is_available BOOLEAN
);

-- Staff table
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(255),
    staff_role VARCHAR(100),
    start_date DATE,
    end_date DATE
);

-- Readers table
CREATE TABLE Readers (
    reader_id INT PRIMARY KEY,
    reader_name VARCHAR(255),
    registered_on DATE,
    total_books_issued INT,
    current_books_issued INT,
    total_fine DECIMAL(10, 2),
    current_fine DECIMAL(10, 2)
);

-- Book Transactions table
CREATE TABLE BookTransactions (
    transaction_id INT PRIMARY KEY,
    book_id INT REFERENCES Books(book_id),
    reader_id INT REFERENCES Readers(reader_id),
    staff_id INT REFERENCES Staff(staff_id),
    transaction_date DATE,
    due_date DATE,
    return_date DATE,
    fine_amount DECIMAL(10, 2),
    fine_paid BOOLEAN
);

-- Library Settings table
CREATE TABLE LibrarySettings (
    setting_id INT PRIMARY KEY,
    max_books_issued_per_reader INT,
    return_days INT,
    fine_per_day DECIMAL(10, 2)
);
