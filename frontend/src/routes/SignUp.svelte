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
        window.location.href = '/profile'
    }
</script>

<h1>Sign Up</h1>
{#if error}
    <p style="color: red;">{error}</p>
{/if}
<div class="flex with-full mt-10">
<form on:submit|preventDefault={signup_user}>
    <label>
        Name:
        <input type="text" bind:value={name} required placeholder="Username"/>
    </label>
    <br />
    <label>
        Email:
        <input type="email" bind:value={email} required placeholder="Email"/>
    </label>
    <br />
    <label>
        Age:
        <input type="number" bind:value={age} placeholder="Age" />
    </label>
    <br />
    <label>
        Password:
        <input type="password" bind:value={password} required placeholder="Password"/>
    </label>
    <br />
    <label>
        Confirm Password:
        <input type="password" bind:value={passwordConfirmation} required placeholder="Confirm Password"/>
    </label>
    <br />
    <button type="submit">Sign Up</button>
</form>
</div>
