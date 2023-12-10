import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

const getStudents = async () => {
  const res = await prisma.students.findMany({
    select: {
      NIM: true,
      Name: true,
      Email: true,
    },
  });
  return res;
};

const getLabAdmins = async () => {
  const res = await prisma.labAdmins.findMany({
    select: {
      NIM: true,
      students: {
        select: {
          Name: true,
          Email: true,
        },
      },
    },
  });
  return res;
};

export default async function Page() {
  const students = await getStudents();
  console.log(students);

  const labAdmins = await getLabAdmins();
  console.log(labAdmins);

  return (
    <main>
      <h1 className="text-3xl font-bold">Mahasiswa</h1>
      <table className="w-full text-center">
        <thead className="bg-gray-200 rounded-md">
          <tr className="p-5">
            <th>NIM</th>
            <th>Name</th>
            <th>Email tes</th>
          </tr>
        </thead>
        <tbody>
          {students.map((students, index) => (
            <tr key={index}>
              <td>{students.NIM}</td>
              <td>{students.Name}</td>
              <td>{students.Email}</td>
            </tr>
          ))}
        </tbody>
      </table>

      <h1 className="text-3xl font-bold">LabAdmin</h1>
      <table className="w-full text-center">
        <thead className="bg-gray-200 rounded-md">
          <tr className="p-5">
            <th>NIM LabAdmin</th>
            <th>Name</th>
            <th>Email</th>
          </tr>
        </thead>
        <tbody>
          {labAdmins.map((labAdmins, index) => (
            <tr key={index}>
              <td>{labAdmins.NIM}</td>
              <td>{labAdmins.students.Name}</td>
              <td>{labAdmins.students.Email}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </main>
  );
}
