<script>
    import { setToken } from '../lib/auth'
    import { apiFetch } from '../lib/api'
    
    let email = ''
    let password = ''
    let name = ''
    let age = null
    let passwordConfirmation = ''
    let error = null
    
    async function signup_user() {
        error = null
    
        const res = await apiFetch('/api/signup', {
        method: 'POST',
        body: JSON.stringify({ email, password, name, age, password_confirmation: passwordConfirmation })
        })
    
        const data = await res.json()
    
        if (!res.ok) {
        error = data.error || 'Signup failed'
        return
        }
    
        setToken(data.token)
        // aquí rediriges al dashboard
    }
</script>

<h1>Sign Up</h1>
{#if error}
    <p style="color: red;">{error}</p>
{/if}
<form on:submit|preventDefault={signup_user}>
    <label>
        Name:
        <input type="text" bind:value={name} required />
    </label>
    <br />
    <label>
        Email:
        <input type="email" bind:value={email} required />
    </label>
    <br />
    <label>
        Age:
        <input type="number" bind:value={age} required />
    </label>
    <br />
    <label>
        Password:
        <input type="password" bind:value={password} required />
    </label>
    <br />
    <label>
        Confirm Password:
        <input type="password" bind:value={passwordConfirmation} required />
    </label>
    <br />
    <button type="submit">Sign Up</button>
</form>
