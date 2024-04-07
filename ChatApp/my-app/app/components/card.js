"use client"
import React from 'react';
import Link from 'next/link';
import axios from 'axios';

export default function QueryCard({ ticketID, user, subject, category }) {
  // Function to extract the first 6 words of the subject
  const truncateSubject = (subject) => {
    // Split the subject into words
    const words = subject.split(' ');
    // Get the first 6 words
    const truncatedSubject = words.slice(0, 6).join(' ');
    return truncatedSubject;
  };

  // Call the truncateSubject function to get the truncated subject
  const truncatedSubject = truncateSubject(subject);

  // Function to summarize subject
  const summarize = () => {
    let data = {
      text: subject
    };

    axios.post('https://13.234.225.39:5000/analyze', data, { withCredentials: true })
      .then(function (response) {
        console.log(response);
        alert(JSON.stringify(response.data));
        // Handle response here, like updating state with the summary
      })
      .catch(function (error) {
        console.log(error);
      });
  };

  let borderColor;
  switch (category) {
    case 'fraud':
      borderColor = 'red';
      break;
    case 'investment':
      borderColor = 'green';
      break;
    case 'loan':
      borderColor = 'gray'; // Changed 'grey' to 'gray'
      break;
    case 'card':
      borderColor = 'gold';
      break;
  }

  // Define inline styles for the border
  const borderStyle = {
    border: `4px solid ${borderColor}`
  };

  return (
    <div className='flex gap-5 items-center font-semibold'>
      <Link href={`/chat/${ticketID}`}>
        <div style={borderStyle} className={`bg-[#02ACCE] w-[25rem] h-28 xl:w-[40rem] rounded-xl mt-5 p-4 flex flex-col cursor-pointer`}>
          <div className='flex justify-between'><h1 className="text-white md:text-xl"> # {ticketID}</h1> <h2 className="text-white md:text-xl"> Category: {category} </h2> </div>
          <h1 className="text-white md:text-xl"> User: {user} </h1>
          <h1 className="text-white md:text-xl"> Subject: {truncatedSubject}... </h1>
        </div>
      </Link>
      <button onClick={summarize} className='shadow-2xl p-1 px-2 rounded-xl h-16 hover:scale-105 bg-[#F09A4F] text-white '> Summarize </button>
    </div>
  );
}
