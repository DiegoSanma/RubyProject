<script>
  import { setToken } from '../lib/auth'
  import { apiFetch } from '../lib/api'

  let email = ''
  let password = ''
  let name = ''
  let age = null
  let passwordConfirmation = ''
  let error = null

  async function login_user() {
    error = null

    const res = await apiFetch('/api/login', {
      method: 'POST',
      body: JSON.stringify({ email, password })
    })

    const data = await res.json()

    if (!res.ok) {
      error = data.error || 'Login failed'
      return
    }

    setToken(data.token)
    // aquí rediriges al dashboard
  }
</script>

<h1>Login</h1>

<input bind:value={email} placeholder="Email" />
<input bind:value={name} placeholder="Name" />
<input bind:value={age} type="number" placeholder="Age" />
<input bind:value={password} type="password" />
<input bind:value={passwordConfirmation} type="password" placeholder="Confirm Password" />

<button on:click={login_user}>Login</button>

{#if error}
  <p style="color:red">{error}</p>
{/if}
