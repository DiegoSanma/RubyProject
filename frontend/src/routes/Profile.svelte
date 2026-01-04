<script>
  import { onMount } from 'svelte'
  import { getMyProfile } from '../lib/api'

  let user
  let error

  onMount(async () => {
    try {
      const token = localStorage.getItem('token')
      if (!token){
        console.log('No token found, redirecting to login')
        window.location.href = '/login'
        return
      }
      user = await getMyProfile(token)
    } catch (e) {
        console.log('Error fetching profile, redirecting to login', e)
        window.location.href = '/login'

    }
  })
</script>

{#if error}
  <p class="text-red-500">{error}</p>
{:else if user}
  <div class="max-w-md mx-auto mt-10 p-6 bg-white rounded-xl shadow">
    <h1 class="text-2xl font-bold">{user.name}</h1>
    <p class="text-gray-600">{user.email}</p>
  </div>
  <div class="max-w-md mx-auto mt-6 p-6 bg-white rounded-xl shadow">
    <h2 class="text-xl font-semibold mb-4">Statistics</h2>
    <ul class="list-disc list-inside">
      <li>Games Played: {user.games_played}</li>
    </ul>
  </div>

{/if}
