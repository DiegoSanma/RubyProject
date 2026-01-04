<script>
  import { getToken, setToken } from '../lib/auth'
  import { apiFetch } from '../lib/api'
  import { push } from 'svelte-spa-router'

  let email = ''
  let password = ''
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
    window.location.href = '/profile'
    
  }
</script>

<div class="flex items-center justify-center with-full mt-10">
  <img src="src/assets/mira.png" class="h-20 mb-6" alt="Rainbow Six Logo" />
</div>
<h1>Login</h1>
<br />
<div class="flex items-center justify-center">
  <div class="w-full max-w-md space-y-4">
    <div class="p-6 bg-white rounded-xl shadow">
      <input
        class="w-full mb-3 p-2 border rounded focus:outline-none focus:ring"
        bind:value={email}
        placeholder="Email"
      />
      <input
        class="w-full p-2 border rounded focus:outline-none focus:ring"
        bind:value={password}
        type="password"
        placeholder="Password"
      />
    </div>

    <div class="p-6 bg-white rounded-xl shadow">
      <button type="button"
        class="w-full bg-blue-600 py-2 rounded hover:bg-blue-700 transition text-center text-black"
        on:click={login_user}
      >
        Login
      </button>
    </div>
  </div>
</div>

{#if error}
  <p style="color:red">{error}</p>
{/if}
