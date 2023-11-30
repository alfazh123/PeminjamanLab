import Navbar from '@/app/ui/navbar';
 
export default function Layout({ children }: { children: React.ReactNode }) {
  return (
    <div className="">
      <div className="w-full flex-none p-6">
        <Navbar />
      </div>
      <div className="flex-grow p-6 md:overflow-y-auto md:p-12">{children}</div>
    </div>
  );
}