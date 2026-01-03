<script>
  let data = null;
  let error = null;

  async function loadBackend() {
    try {
      const res = await fetch('/api/v1/health');
      data = await res.json();
    } catch (e) {
      error = e;
    }
  }

  loadBackend();
</script>

<main>
  <h1>Svelte + Rails API :)</h1>

  {#if data}
    <pre>{JSON.stringify(data, null, 2)}</pre>
  {/if}

  {#if error}
    <p style="color:red">{error.message}</p>
  {/if}
</main>