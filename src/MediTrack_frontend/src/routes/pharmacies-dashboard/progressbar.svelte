<script>
    export let percentage = 0;
  </script>
  
  <div class="progress-bar">
    <div class="progress-bar-inner" style="width: {percentage}%;"></div>
  </div>
  
  <style>
    .progress-bar {
      width: 100%;
      background-color: #e2e8f0;
      border-radius: 0.25rem;
      overflow: hidden;
      height: 1rem;
    }
  
    .progress-bar-inner {
      height: 100%;
      background-color: #FFAF00;
      transition: width 0.3s ease;
    }
  </style>
  