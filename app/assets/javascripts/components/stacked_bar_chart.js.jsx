import  {BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend} from 'recharts';

// this is what the data should look like coming out of the controller
// const exampleData = [
//     { date: '2016-01-01', url[1]: 4000, url[2]: 2400, url[3]: 2400 }, --> and so on for as many URLS as there are
// ];

class StackedBarChart extends React.Component {
    // propTypes should pull the info from rails into the react element
  // propTypes: {
  //   data: array
  // },
    render () {
        return (
            <BarChart width={600} height={300} data={data}
                      margin={{top: 20, right: 30, left: 20, bottom: 5}}>
                <XAxis dataKey="name"/>
                <YAxis/>
                <CartesianGrid strokeDasharray="3 3"/>
                <Tooltip/>
                <Legend />
                <Bar dataKey="url" stackId="a" fill="#8884d8" />
            </BarChart>
        );
    }
}

ReactDOM.render(
    <StackedBarChart />,
    document.getElementById('container')
);

