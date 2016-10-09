perks = Perk.create(
  [
    {
      name: "Mentors",
      description: "Bring mentors from your company.",
      level: :spectator
    },
    {
      name: "Sponsor Table",
      description: "Set up a table to represent your company.",
      level: :bronze
    },
    {
      name: "Sponsor Challenge and Prize",
      description: "Challenge the hackers and offer a prize for the winner.",
      level: :silver
    },
    {
      name: "Judging",
      description: "Judge the hacks.",
      level: :gold
    },
    {
      name: "Networking Event",
      description: "Host a networking event for your company before the hacking begins.",
      level: :gold
    },
    {
      name: "Tech Talk",
      description: "Host a tech talk during the hackathon.",
      level: :platinum
    },
    {
      name: "Resume Access",
      description: "Gain access to the resumes of the hackathon attendees.",
      level: :silver
    },
    {
      name: "Early Resume Access",
      description: "Get earlier access to resumes.",
      level: :gold
    },
    {
      name: "Job Posting",
      description: "Post job opportunies in the newsletter.",
      level: :gold
    },
    {
      name: "Private Recruitment Lounge",
      description: "Your own fancy suite.",
      level: :platinum
    },
    {
      name: "Newsletter",
      description: "Be in the hackathon's newsletter.",
      level: :bronze
    },
    {
      name: "Opening Keynote",
      description: "Speak at the hackathon's opening ceremony. Silver: 1 min. Gold: 3 min. Platinum: 5 min.",
      level: :silver
    },
    {
      name: "Pre-Hype Event",
      description: "Host a pre-hype event for the hackathon.",
      level: :gold
    },
    {
      name: "Closing Keynote",
      description: "Speak at the closing keynote.",
      level: :platinum
    },
    {
      name: "Logo on Website",
      description: "Have your company logo on our website.",
      level: :bronze
    },
    {
      name: "Swag Distribution",
      description: "Distribute swag to the hackathon attendees.",
      level: :bronze
    },
    {
      name: "Logo on Prints",
      description: "Shirts, Flyers, etc.",
      level: :silver
    },
    {
      name: "Social Media Shout-Out",
      description: "We'll give you a shout-out on our social media accounts.",
      level: :gold
    },
    {
      name: "Branding on Stage",
      description: "Your brand on our stage.",
      level: :platinum
    }
  ]
)

tasks = Task.create(
  [
    {
      name: "Upload Logo"
    },
    {
      name: "Send Payment"
    },
    {
      name: "Update Contact Information"
    },
    {
      name: "Fill Out Mentor Form"
    },
    {
      name: "Sponsor Table Confirmation"
    },
    {
      name: "Submit Challenge Information"
    },
    {
      name: "Fill Out Judging Form"
    },
    {
      name: "Enter Networking Event Details"
    },
    {
      name: "Enter Tech Talk Details"
    },
    {
      name: "Send in Job Postings to be Published"
    },
    {
      name: "Opening Keynote Confirmation"
    },
    {
      name: "Enter Pre-Hype Event Information"
    },
    {
      name: "Enter Pre-Hype Event Information"
    },
    {
      name: "Inform us of Swag Shipment"
    }
  ]
)
