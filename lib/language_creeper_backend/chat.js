module.exports = (io) => {
  io.on("connection", (socket) => {
    console.log("A user connected!");

    socket.on("chatMessage", (data) => {
      io.emit("chatMessage", data);
    });

    socket.on("quizUpdate", (data) => {
      io.emit("quizUpdate", data);
    });

    socket.on("disconnect", () => {
      console.log("User disconnected.");
    });
  });
};