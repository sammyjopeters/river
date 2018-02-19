import  {BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend} from 'recharts';

// this is what the data should look like coming out of the controller
// const exampleData = [
//     { date: '2016-01-01', url_1: 4000, url_1: 2400, url_2: 2400 }, --> and so on for as many URLS as there are
// ];

class StackedBarChart extends React.Component {
    // propTypes should pull the info from rails into the react element
  // propTypes: {
  //   data: array
    // labels: object (I think? however you model a hash in react?)
  // },
    render () {
        return (
            <BarChart width={600} height={300} data={data}
                      margin={{top: 20, right: 30, left: 20, bottom: 5}}>
                <XAxis dataKey="date"/>
                <YAxis/>
                <CartesianGrid strokeDasharray="3 3"/>
                <Tooltip/>
                <Legend />
                <Bar dataKey="url_0" stackId="a" fill="#8874d8" />
                <Bar dataKey="url_1" stackId="a" fill="#FF5733" />
                <Bar dataKey="url_2" stackId="a" fill="#FF33FC" />
                <Bar dataKey="url_3" stackId="a" fill="#FFCE33" />
                <Bar dataKey="url_4" stackId="a" fill="#82ca3d" />
                <Bar dataKey="url_5" stackId="a" fill="#FF338A" />
                <Bar dataKey="url_6" stackId="a" fill="#6133FF" />
                <Bar dataKey="url_7" stackId="a" fill="#82ca1d" />
                <Bar dataKey="url_8" stackId="a" fill="#958ABB" />
                <Bar dataKey="url_9" stackId="a" fill="#82ca93" />
            </BarChart>
        );
    }
}

ReactDOM.render(
    <StackedBarChart />,
    document.getElementById('container')
);

