Config = {}

Config.JobCenters = {

    {
        label = 'Job Center',
        desc = 'Great place to get a job!',
        coords = vector3(-151.5033, 6322.404, 31.55457),
        blip = {
            sprite = 351,
            color = 69,
            scale = 0.8
        },
        jobs = {
            {
                label = 'Police',
                desc = 'Protect civilians',
                salary = 100,
                name = 'police'
            },
            {
                label = 'Ambulance',
                desc = 'Heal civilians',
                salary = 200,
                name = 'ambulance'
            }
        }
    }

}

Config.Locale = {
    getjob = 'Employ',
    leavejob = 'Leave a job',
    close = 'Close'
}