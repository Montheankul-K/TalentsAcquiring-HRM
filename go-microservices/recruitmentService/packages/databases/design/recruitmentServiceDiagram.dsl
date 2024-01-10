Table Recruitment {
  recruitment_id integer [primary key, ref: < Candidate.recruitment_id]
  position_id integer [not null]
  status varchar [not null]
  interview_date timestamp
  created_at timestamp
  updated_at timestamp
  current_flag boolean [not null]
}

Table Candidate {
  candidate_id integer [primary key, ref: - Application.candidate_id]
  recruitment_id integer [not null]
  firstname varchar [not null]
  lastname varchar [not null]
  email varchar [not null]
  phone varchar [not null]
  resume_url varchar [not null]
  created_at timestamp
  updated_at timestamp
  current_flag boolean [not null]
}

Table Application {
  application_id integer [primary key]
  candidate_id integer [not null]
  job_id integer [not null]
  application_date timestamp [not null]
  status varchar [not null]
  created_at timestamp
  updated_at timestamp
  current_flag boolean [not null]
}

Table Job {
  job_id integer [primary key, ref: - Application.job_id]
  title varchar 
  description text
  requirement text
  created_at timestamp
  updated_at timestamp
  current_flag boolean [not null]
}

Table Position {
  position_id integer [primary key, ref: - Recruitment.position_id]
  title varchar
  description text
  created_at timestamp
  updated_at timestamp
  current_flag boolean [not null]
}

