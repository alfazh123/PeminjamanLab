import { sql } from '@vercel/postgres'
import {
	Users,
	Borrow,
	LatestBorrow,
	BorrowTable,
	Labolatory,
} from './definitions'

export async function fetchUser() {
	try {
		const users = await sql<Users[]>`
            SELECT * FROM users
        `
		return users.rows
	} catch (error) {
		console.log(error)
	}
}

export async function fetchBorrow() {
	const borrow = await sql<Borrow[]>`
        SELECT * FROM borrows
    `
	return borrow.rows
}

export async function fetchLatestBorrow() {
	const latestBorrow = await sql<LatestBorrow[]>`
        SELECT DISTINCT ON (user_id) * FROM borrows
        ORDER BY user_id, borrow_date DESC
    `
	return latestBorrow.rows
}

export async function fetchBorrowTable() {
	const borrowTable = await sql<BorrowTable[]>`
        SELECT borrows.id, borrows.user_id, borrows.lab_id, labs.name AS lab_name, borrows.assistant_id, users.name AS assistant_name, borrows.borrow_date, borrows.time_start, borrows.time_end, users.name AS user_name, labs.usage
        FROM borrows
        INNER JOIN labs ON borrows.lab_id = labs.id
        INNER JOIN users ON borrows.assistant_id = users.id
    `
	return borrowTable.rows
}

export async function fetchLabolatory() {
	const labolatory = await sql<Labolatory[]>`
        SELECT * FROM labs
    `
	return labolatory.rows
}
