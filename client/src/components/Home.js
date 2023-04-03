import React from "react";
import About from "./About";
// import image1 from "../images/image1.jpeg";

function Home() {
  return (
    <div className="page">
      <div className="homepage">
        <p className="paragraph">Campers Have 'smore Fun!</p>
      </div>
      <div>
        <About />
      </div>
    </div>
  );
}

export default Home;
