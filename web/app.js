function main() {
    return {
        display: false,
        btns: false,
        label: '',
        desc: '',
        close: '',
        leavejob: '',
        getjob: '',
        jobname: '',
        joblabel: '',
        jobs: [],
        select(job) {
            this.btns = true;
            this.jobname = job.name;
            this.joblabel = job.label;
        },
        employ() {
            // [DEBUG]
            //console.log(`Isidarbinote i ${this.joblabel} (${this.jobname})`)
            post('employ', {job: this.jobname, label: this.joblabel})
        },
        leave() {
            // [DEBUG]
            // console.log(`Palikote darba`)
            post('leavejob', {job: 'unemployed'})
        },
        exit() {
            this.display = false;
            this.btns = false;
            post('close')
        },
        init() {
            window.addEventListener('message', (event) => {
                let data = event.data;
                switch (data.type) {
                    case 'show':
                        this.display = true;
                        this.jobs = data.jobs;
                        this.label = data.label;
                        this.desc = data.desc;
                        this.close = data.close;
                        this.leavejob = data.leavejob;
                        this.getjob = data.getjob;
                        break;
                }
            });
        }
    }
}

async function post(event = "", data = {}) {
    const response = await fetch(`https://${GetParentResourceName()}/${event}`, {
    method: "POST", // *GET, POST, PUT, DELETE, etc.
    mode: "cors", // no-cors, *cors, same-origin
    cache: "no-cache", // *default, no-cache, reload, force-cache, only-if-cached
    credentials: "same-origin", // include, *same-origin, omit
    headers: {
        "Content-Type": "application/json",
    },
    redirect: "follow",
    referrerPolicy: "no-referrer",
    body: JSON.stringify(data),
    });
    return response.json();
}