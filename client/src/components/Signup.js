import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

function Signup({ onLogin }) {
  const navigate = useNavigate();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [passwordConfirmation, setPasswordConfirmation] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [errors, setErrors] = useState([]);

  function handleSubmit(e) {
    e.preventDefault();
    setErrors([]);
    setIsLoading(true);
    fetch("/signup", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        username,
        password,
        password_confirmation: passwordConfirmation,
      }),
    }).then((r) => {
      setIsLoading(false);
      if (r.ok) {
        r.json().then((user) => {
          onLogin(user);
          navigate("/home");
        });
      } else {
        r.json().then((err) => setErrors(err.errors));
      }
    });
  }

  return (
    <form>
      <div className="main">
        {errors.map((error) => {
          return (
            <p style={{ color: "white" }} key={error}>
              {error}
            </p>
          );
        })}
        <div>
          <div>
            <input
              type="text"
              placeholder="username"
              className="name"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
            />
          </div>
          <br />
          <div>
            <input
              type="password"
              placeholder="password"
              className="name"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
          </div>
          <br />
          <div>
            <input
              type="password"
              placeholder="password confirmation"
              className="name"
              value={passwordConfirmation}
              onChange={(e) => setPasswordConfirmation(e.target.value)}
            />
          </div>
          <br />
          <div>
            <button onClick={handleSubmit} type="button" className="button-1">
              Signup
            </button>
          </div>
          <br />
        </div>
      </div>
    </form>
  );
}

export default Signup;
