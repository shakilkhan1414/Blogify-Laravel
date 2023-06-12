<x-admin-master>

    @section('main-content')

        @if (auth()->user()->userHasRole('Admin'))

            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <canvas id="myChart"></canvas>
            <script>
                const ctx = document.getElementById('myChart').getContext('2d');
                const myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['Users', 'Blogs', 'Categories','Roles'],
                        datasets: [{
                            label: 'Site Status',
                            data: [{{App\Models\User::count()}}, {{App\Models\Post::count()}}, {{App\Models\Category::count()}},{{App\Models\Role::count()}}],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            </script>

            <style>
                #myChart{
                    height: 500px !important;
                    width: 800px !important;
                }

            </style>

        @else

        <h3>Only Admin can access this page!</h3>

        @endif


    @endsection



</x-admin-master>


