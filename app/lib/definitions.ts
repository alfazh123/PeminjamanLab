// This file contains type definitions for your data.
// It describes the shape of the data, and what data type each property should accept.
// For simplicity of teaching, we're manually defining these types.
// However, these types are generated automatically if you're using an ORM such as Prisma.

export type User = {
  id: number;
  name: string;
  email: string;
  role: string;
};

export type Borrow = {
    id: number;
    user_id: number;
    lab_id: number;
    assistant_id: number;
    borrow_date: Date;
    time_start: Date;
    time_end: Date;
};

export type LatestBorrow = {
    id: number;
    user_id: number;
    lab_id: number;
    borrow_date: Date;
};

export type BorrowTable = {
    id: number;
    user_id: number;
    lab_id: number;
    lab_name: string;
    assistant_id: number;
    assistant_name: string;
    borrow_date: Date;
    time_start: Date;
    time_end: Date;
    user_name: string;
    usage: string;
};

export type Labolatory = {
    id: number;
    name: string;
    capacity: number;
};