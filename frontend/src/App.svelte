<script>
  import { Router, Route } from 'svelte-routing'
  import Login from './routes/Login.svelte'
</script>
<Router>
  <Route path="/login">
    <Login />
  </Route>
</Router>