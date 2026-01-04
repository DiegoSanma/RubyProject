<script>
    import { onMount } from 'svelte'
    import { logout } from '../lib/auth'
    onMount(() => {
        logout()
    })
</script>

<h1>Thank you for using Rainbow Six Wordle!</h1>

<a href="/" class="text-fg-brand underline">
    <div class="text-center mt-4">
        <p>Click on lesion to head back to home page</p>
        <img src="src/assets/lesion.png" alt="Sign Out Image" class="mx-auto my-8 w-1/3"/> 
    </div>
</a>