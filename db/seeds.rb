s2015 = Semester.create!(season: 'Spring', year: 2015)
f2017 = Semester.create!(season: 'Fall', year: 2017, current: true)
dollar_sign_lin = Lineage.create!(name: '$lin')
wincest_lin = Lineage.create!(name: 'Wincest')
alpha_chi = PledgeClass.create!(name: 'Alpha Chi', semester: s2015)
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

(1..5).each do |num|
  ServiceProject.create!(
    name: "Service Project #{num}",
    semester: f2017,
    start_time: DateTime.new(2017, 9, 17 + (2 * num), 12 + num, 0, 0),
    end_time: DateTime.new(2017, 9, 17 + (2 * num), 13 + num, 30, 0),
    location: "Location #{num}",
    project_type: 'General Service Project',
    max_volunteers: num < 2 ? 2 : num
  )
end

(1..5).each do |num|
  Fellowship.create!(
    semester: f2017,
    name: "Fellowship #{num}",
    fellowship_type: 'Regular',
    location: "Location #{num}",
    description: 'Fun, fun, fun!',
    start_time: DateTime.new(2017, 9, 17 + (2 * num), 12 + num, 0, 0),
    end_time: DateTime.new(2017, 9, 17 + (2 * num), 13 + num, 30, 0),
  )
end
