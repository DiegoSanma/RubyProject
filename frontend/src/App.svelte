<script>
  import { Router, Route } from 'svelte-routing'
  import Login from './routes/Login.svelte'
  import Signup from './routes/SignUp.svelte'
  import FriendRequests from './routes/FriendRequests.svelte'
  import Users from './routes/Users.svelte'
  import Navbar from './lib/Navbar.svelte'
  import './app.css'
</script>
<Navbar />
<Router>
  <Route path="/login">
    <Login />
  </Route>
  <Route path="/signup">
    <Signup />
  </Route>
  <Route path="/friend-requests">
    <FriendRequests />
  </Route>
  <Route path="/users">
    <Users />
  </Route>
</Router>