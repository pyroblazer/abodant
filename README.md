# Abodant

<p align="center">
<img alt="Abodant" src="https://github.com/pyroblazer/abodant/blob/master/public/nav.gif">
</p>

Abodant is a Ruby on Rails project designed to create a comprehensive property sales portal. It features three distinct user roles: Admin, Realtor, and House Hunter, each with specific permissions and responsibilities.

## User Roles and Credentials

| Role        | Email              | Password | Notes                           |
|-------------|--------------------|----------|---------------------------------|
| Admin       | admin@abodant.com  | password | Cannot be deleted                |
| House Hunter | hunter@abodant.com | password | Can be deleted by admin          |
| Realtor     | realtor@abodant.com| password | Can be deleted by admin          |

## Local Deployment Instructions

To set up Abodant on your local machine, follow these steps:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/pyroblazer/abodant.git
   ```

2. **Navigate to the Project Directory:**

   ```bash
   cd abodant
   ```

3. **Install Dependencies:**

   ```bash
   bundle install
   ```

4. **Run Database Migrations:**

   ```bash
   rake db:migrate
   ```

5. **Seed the Database with Pre-configured Users:**

   ```bash
   rake db:seed
   ```

6. **Start the Rails Server:**

   ```bash
   rails server
   ```

   Your application will be accessible at [http://localhost:3000](http://localhost:3000).

## Features

### Admin
- Log in and manage the system
- Create and delete realtor and house hunter accounts
- Create and remove real estate companies
- View and delete properties and inquiries
- View detailed information of users (excluding passwords) and real estate companies

### Realtor
- Log in/sign up and manage profile
- Create or edit a real estate company
- List, edit, and remove houses (only those listed by the realtor)
- View all houses and inquiries for any house within their company
- Respond to inquiries from house hunters
- Manage potential buyers and inquiries

### House Hunter
- Log in/sign up and manage profile
- Search for houses using various filters (price, size, location)
- View details of real estate companies and houses
- Send inquiries and mark houses of interest
- Add or remove houses from their interest list

### Special Cases
- Deleting a company will also delete all associated properties and disassociate the company from realtors
- Realtors can no longer edit houses if they change companies
- Deleting a house hunter will remove all their inquiries and their name from any potential buyer lists

### Notifications
- When a realtor responds to a house hunter's inquiry, an email is sent to the house hunter.

## Testing

Abodant includes comprehensive tests for the users model and controller. To run these tests, follow these steps:

### Model Tests

1. **Navigate to the Project Directory:**

   ```bash
   cd abodant
   ```

2. **Run the Model Tests:**

   ```bash
   bin/rails test test/models/user_test.rb
   ```

### Controller Tests

1. **Navigate to the Project Directory:**

   ```bash
   cd abodant
   ```

2. **Run the Controller Tests:**

   ```bash
   bin/rails test test/controllers/user_controller_test.rb
   ```

Feel free to reach out if you encounter any issues or have questions about the project!