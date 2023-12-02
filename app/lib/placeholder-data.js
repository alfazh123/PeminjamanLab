const admin = [
	{
		id: 1,
		username: 'admin',
		password: 'admin',
		role: 'admin',
	},
]

const users = [
	{
		id: 1,
		username: 'budi',
		role: 'mahasiswa',
		email: 'budi@gmail.com',
	},
	{
		id: 2,
		username: 'andi',
		role: 'mahasiswa',
		email: 'andi@gmail.com',
	},
	{
		id: 3,
		username: 'caca',
		role: 'dosen',
		email: 'caca@gmail.com',
	},
	{
		id: 4,
		username: 'didi',
		role: 'dosen',
		email: 'didi@gmail.com',
	},
	{
		id: 5,
		username: 'sugeng',
		role: 'dosen',
		email: 'sugeng@gmail.com',
	},
	{
		id: 6,
		username: 'gigi',
		role: 'mahasiswa',
		email: 'gigi@gmail.com',
	},
	{
		id: 7,
		username: 'bambang',
		role: 'mahasiswa',
		email: 'bambang@gmail.com',
	},
]

const labolatory = [
	{
		id: 1,
		lab_name: 'Lab. Komputasi',
		capacity: 50,
	},
	{
		id: 2,
		lab_name: 'Lab. Jaringan',
		capacity: 50,
	},
	{
		id: 3,
		lab_name: 'Lab. Sistem Informasi',
		capacity: 50,
	},
	{
		id: 4,
		lab_name: 'Lab. Multimedia',
		capacity: 50,
	},
]

const asisten_lab = [
	{
		id: 1,
		id_lab: labolatory[0].id,
		id_user: users[2].id,
	},
	{
		id: 2,
		id_lab: labolatory[1].id,
		id_user: users[3].id,
	},
	{
		id: 3,
		id_lab: labolatory[2].id,
		id_user: users[4].id,
	},
	{
		id: 4,
		id_lab: labolatory[3].id,
		id_user: users[5].id,
	},
]

const borrow = [
	{
		id_borrow: 1,
		id_user: users[0].id,
		lab: labolatory[0].id,
		id_asisten: asisten_lab[0].id,
		date: '2020-12-12',
		time_start: '12:00:00',
		time_end: '14:00:00',
		usage: 'kelas',
	},
	{
		id_borrow: 2,
		id_user: users[1].id,
		lab: labolatory[1].id,
		id_asisten: asisten_lab[1].id,
		date: '2020-12-12',
		time_start: '12:00:00',
		time_end: '14:00:00',
		usage: 'kelas',
	},
	{
		id_borrow: 3,
		id_user: users[2].id,
		lab: labolatory[2].id,
		id_asisten: asisten_lab[2].id,
		date: '2020-12-12',
		time_start: '12:00:00',
		time_end: '14:00:00',
		usage: 'kelas',
	},
	{
		id_borrow: 4,
		id_user: users[3].id,
		lab: labolatory[3].id,
		id_asisten: asisten_lab[3].id,
		date: '2020-12-12',
		time_start: '12:00:00',
		time_end: '14:00:00',
		usage: 'kelas',
	},
	{
		id_borrow: 5,
		id_user: users[4].id,
		lab: labolatory[0].id,
		id_asisten: asisten_lab[0].id,
		date: '2020-12-12',
		time_start: '12:00:00',
		time_end: '14:00:00',
		usage: 'kelas',
	},
	{
		id_borrow: 6,
		id_user: users[5].id,
		lab: labolatory[1].id,
		id_asisten: asisten_lab[1].id,
		date: '2020-12-12',
		time_start: '12:00:00',
		time_end: '14:00:00',
		usage: 'kelas',
	},
	{
		id_borrow: 7,
		id_user: users[6].id,
		lab: labolatory[2].id,
		id_asisten: asisten_lab[2].id,
		date: '2020-12-12',
		time_start: '12:00:00',
		time_end: '14:00:00',
		usage: 'kelas',
	},
	{
		id_borrow: 8,
		id_user: users[0].id,
		lab: labolatory[3].id,
		id_asisten: asisten_lab[3].id,
		date: '2020-12-12',
		time_start: '12:00:00',
		time_end: '14:00:00',
		usage: 'kelas',
	},
]

module.exports = {
	admin,
	users,
	labolatory,
	asisten_lab,
	borrow,
}
