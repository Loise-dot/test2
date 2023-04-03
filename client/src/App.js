import React, { useState, useEffect } from "react";
import "./App.css";
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/css/bootstrap.css";
import { Routes, Route } from "react-router-dom";
import Home from "./components/Home";
import Blog from "./components/Blog";
import LoginForm from "./LoginForm";
import Signup from "./Signup";
import NavBar from "./NavBar";
import Login from "./Login";

function App() {
  const [user, setUser] = useState(null);

  useEffect(() => {
    fetch("/me").then((r) => {
      if (r.ok) {
        r.json().then((user) => setUser(user));
      }
    });
  }, []);

  if (!user) return <Login onLogin={setUser} />;

  return (
    <div>
      <div>
        <NavBar user={user} setUser={setUser} />
      </div>
      <Routes>
        <Route
          exact
          path="/"
          element={<Home user={user} setUser={setUser} />}
        />
        <Route exact path="/blog" element={<Blog />} />
        <Route exact path="/login" element={<LoginForm />} />
        <Route exact path="/signup" element={<Signup />} />
      </Routes>
    </div>
  );
}

export default App;
