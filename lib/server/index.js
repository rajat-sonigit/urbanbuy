const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

const PORT = process.env.PORT || 3000;
const app = express();

app.use(express.json());
app.use(authRouter);

const DB = "mongodb+srv://rjrs045:Act9sF42CsW6QaG0@cluster0.fncqxej.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
    // Start the server only after successful DB connection
    app.listen(PORT, "0.0.0.0", () => {
      console.log(`Server connected at port ${PORT}`);
    });
  })
  .catch((e) => {
    console.error("Connection error", e);
  });

console.log('Server script initialized');
