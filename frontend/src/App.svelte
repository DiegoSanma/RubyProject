<script>
  import { Router, Route } from 'svelte-routing'
  import Login from './routes/Login.svelte'
  import Homepage from './routes/Homepage.svelte'
</script>
<Router>
  <Route path="/login">
    <Login />
  </Route>
  <Route path="/">
    <Homepage />
  </Route>
</Router>
