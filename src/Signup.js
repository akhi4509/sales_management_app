import React, { useState } from 'react';
import { View, Text, TextInput, StyleSheet, TouchableOpacity, KeyboardAvoidingView, Platform , Button} from 'react-native';
import LinearGradient from 'react-native-linear-gradient';
import { useNavigation } from '@react-navigation/native';

const Signup = () => {
    const navigation = useNavigation();
  // State variables for each form field
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  // Function to handle the submission of the form
  const handleRegister = () => {
    // Send registration data to PHP API
    fetch('http://localhost/sales_app/register.php', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        name,
        email,
        username,
        password,
      }),
    })
      .then(response => response.text())
      .then(data => {
        // Handle API response
        Alert.alert('Registration Status', data);
      })
      .catch(error => {
        console.error('Error:', error);
      });
  };

    return (
      
    <View style={styles.container}>
      <LinearGradient
        colors={['#ff6e7f', '#bfe9ff']}  // Gradient colors from pink to light blue
        style={styles.gradient}
      >
      <Text style={styles.title}>Registration Form</Text>
      
      <TextInput
        style={styles.input}
        placeholder="Name"
        value={name}
        onChangeText={text => setName(text)}
      />

      <TextInput
        style={styles.input}
        placeholder="Email"
        value={email}
        onChangeText={text => setEmail(text)}
      />

      <TextInput
        style={styles.input}
        placeholder="Username"
        value={username}
        onChangeText={text => setUsername(text)}
      />

      <TextInput
        style={styles.input}
        placeholder="Password"
        value={password}
        onChangeText={text => setPassword(text)}
        secureTextEntry={true}
      />

      <Button
        title="Register"
        onPress={handleRegister}
          />
          
          <View style={styles.signupContainer}>
                  <Text style={styles.signupText}>Already a user? </Text>
                  <TouchableOpacity onPress={() => navigation.navigate('Login')}>
                        <Text style={styles.signupLink}>Login</Text>
                    </TouchableOpacity>
        </View>
    </LinearGradient>
        </View>
  );
};

const styles = StyleSheet.create({
   container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  gradient: {
    width: '100%',
    height: '100%',
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    color: 'white',
    marginBottom: 30,
  },
  input: {
    width: 300,
    height: 50,
    paddingHorizontal: 10,
    borderRadius: 25,
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    color: 'white',
    marginBottom: 15,
    fontSize: 16,
  },
  button: {
    width: 150,
    height: 50,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#ffffff',
    borderRadius: 25,
    marginTop: 20,
  },
  buttonText: {
    color: '#ff6e7f',
    fontSize: 18,
    fontWeight: 'bold',
    },
    signupContainer: {
    flexDirection: 'row',
    marginTop: 20,
  },
  signupText: {
    color: 'black',
    fontSize: 16,
  },
  signupLink: {
    color: '#000000',
    fontSize: 16,
    fontWeight: 'bold',
  },
});

export default Signup;