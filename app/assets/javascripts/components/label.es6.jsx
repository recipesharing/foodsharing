class Label extends React.Component {
  constructor(props) {
    super(props);
    this.state = { date: new Date(), label: 'Toan' };
  }

  componentDidMount(){
    this.timerID = setInterval(() => this.tick(), 1000);
  }

  componentWilUnmount(){
    clearInterval(this.timerID);
  }

  tick() {
    this.setState({
      date: new Date()
    });
  }
  stopTimer() {
    // console.log("I will stop this timer haha!");
    this.setState({
      label: 'timer not stop'
    });
  }

  render () {
    return (
      <div>
        <div>Label: {this.state.label}</div>
        <h1>{ this.state.date.toLocaleTimeString() }</h1>
        <button className="btn btn-default" onClick = {() => this.stopTimer()}>stop me</button>
      </div>
    );
  }
}

Label.propTypes = {
  label: React.PropTypes.string
};
