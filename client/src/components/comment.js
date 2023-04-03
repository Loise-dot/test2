import React from "react";
import { Routes, Route } from "react-router-dom";
import Blog from "./Blog";
import CommentSection from "./CommentSection";

function App() {
  return (
    <Routes>
      <Route path="/" element={<Blog />} />
      <Route path="/comments/:id" element={<CommentSection />} />
    </Routes>
  );
}

export default App;
