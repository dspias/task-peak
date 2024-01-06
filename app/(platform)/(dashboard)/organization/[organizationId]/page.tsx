import { db } from "@/lib/db";

const OrganizationIdPage = () => {
  async function create(fromData: FormData) {
    "use server";

    const title = fromData.get("title") as string;
    const board = await db.board.create({
      data: {
        title,
      },
    });
    console.log(board);
  }

  return (
    <div>
      <form action={create}>
        <input
          id="title"
          name="title"
          required
          placeholder="Enter a board title"
          className="border-black border p-1"
        />
      </form>
    </div>
  );
};

export default OrganizationIdPage;
