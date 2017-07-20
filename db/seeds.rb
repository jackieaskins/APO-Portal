dollar_sign_lin = Lineage.create!(name: '$lin')
wincest_lin = Lineage.create!(name: 'Wincest')
alpha_chi = PledgeClass.create!(name: 'Alpha Chi')
User.create!(
  email: 'jackie@example.com',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Jacqueline',
  last_name: 'Askins',
  preferred_name: 'Jackie',
  pledge_class: alpha_chi,
  lineage: dollar_sign_lin,
  campus_address: 'Harnwell 1409',
  phone_number: '(609) 579-9085',
  graduation_year: 2018,
  graduation_semester: 'Spring',
  school: 'College of Arts & Sciences',
  major: 'Cognitive Science, Computer Science',
  birthday: '1996-07-15'
)
User.create!(
  email: 'logan@example.com',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Logan',
  last_name: 'Castrucci',
  pledge_class: alpha_chi,
  lineage: wincest_lin,
  campus_address: '4035 Chestnut Street Apt. 102',
  phone_number: '(484) 356-3690',
  graduation_year: 2018,
  graduation_semester: 'Spring',
  school: 'College of Arts & Sciences',
  major: 'Cognitive Science',
  minor: 'Computer Science, French, Linguistics',
  birthday: '1996-03-02'
)
ServiceProject.create!(
  name: 'Test Service Project',
  start_time: DateTime.now.change({ hour: 18, min: 0, sec: 0 }),
  end_time: DateTime.now.change({ hour: 19, min: 30, sec:0 }),
  location: 'Harnwell 1409',
  project_type: 'General Service Project',
  max_volunteers: 2
)
