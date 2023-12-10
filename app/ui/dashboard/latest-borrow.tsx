import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default async function latestBorrow() {
  return (
    <main className="w-md">
      <h1 className="text-3xl font-bold">Latest Usage</h1>
      <table className="w-full text-center">
        <thead className="bg-gray-200 rounded-md">
          <tr className="p-5">
            <th>ID</th>
            <th>Type</th>
            <th>Duration</th>
          </tr>
        </thead>
        <tbody>
          {/* {latestUsages.map((latestUsage, index)=>(
                        <tr key={index} className="p-5">
                            <td>{latestUsage.LabUsageID}</td>
                            <td>{latestUsage.LAbUsageType}</td>
                            <td>{latestUsage.LabUsageDuration}</td>
                        </tr>
                    ))} */}
        </tbody>
      </table>
    </main>
  );
}
